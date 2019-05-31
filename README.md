# wmts-seeder
Environment for WMTS seeding.

## Zweck
Umgebung für das Herstellen (Seeden) der WMTS-Kacheln für statische Geodaten (i.d.R. Rasterdaten). Das Seeden wird mit Hilfe von `vagrant` und `Docker` lokal durchgeführt und das Endprodukt, die SQlite-Datenbanken, müssen durch die GDI manuell deployed werden. Statisch bedeutet, dass die Daten über die Zeit nicht ändern und das das Seeden für den Datensatz nur einmal gemacht werden muss. Dazu gehören auch die Landeskarten, die einen relativ langen Nachführungszyklus aufweisen.

## Umgebung
Die Vagrantmaschine dient zur Herstellung der QGIS-Projektdateien (*.qgs). Aus diesen Projektdateien wird der WMS-Dienst konfiguriert. Für jede Rasterebene (z.B. Orthofoto 2018 RGB) wird eine eigene QGIS-Projektdatei erstellt und ist das Original (der Master).

Der WMS-Dienst (QGIS-Server) und Mapcache laufen zusammen in einem Dockercontainer. Die QGIS-Projektdateien und die Mapcache-Konfiguration (`mapcache.xml`) werden in das Dockerimage kopiert. Die `mapcache.xml`-Datei kann nicht für die GDI-Produktionsumgebung übernommen werden, da die WMS-URL nicht identisch sind. Sie muss durch die GDI manuell nachgeführt werden.

## Daten
todo: ... Daten müssen im GDI `geodata`-Verzeichnis vorhanden sein... Lokal kopieren o.ä.

## Vagrant
* Basisimage: Ubuntu 18.04
* QGIS LTR (3.4.x)
* gdal/ogr
* x2go: (IP: 127.0.0.1, SSH: 2027, vagrant/vagrant)
* IP: 192.168.50.7
* todo: "Synced folder" (auf Host) für die Geodaten muss ggf. angepasst werden. Wichtig ist, dass der Mountpoint in der Vagrantmaschine stabil bleibt (`/geodata/`).
* todo: QGIS-Projekte müssen absolute Pfade verwenden.

## Docker
* Basisimage: Phusion 0.11
* QGIS-Server LTR (3.4.x)
* Mapcache 1.6.1
* Min-/Max-FCGI-Prozesse sind als Env-Variablen definiert.
* todo: QGIS-Projektdateien müssen in den Ordner `/XXXXX` gemountet oder kopiert werden.
* todo: Die Machcache-Konfigurationsdatei muss in den Ordern `/XXXXX` gemountet oder kopiert werden.
* Die Geodaten müssen immer in den Container gemounted werden. Der Mountpoint muss dem der Vagrantmaschine entsprechen, damit die QGIS-Projektdateien funktionieren.


Docker Image erstellen:
```
docker build -t sogis/wmts-seeder .
```

Docker Container starten:

Externe QGIS-Projekt-Dateien mounten:
```
docker run -p 80:80 -v /Users/stefan/sources/wmts-seeder/qgis/qgs:/data -v /Volumes/Samsung_T5:/geodata -e QGIS_FCGI_MIN_PROCESSES=4 -e QGIS_FCGI_MAX_PROCESSES=4 sogis/wmts-seeder --rm --name wmts-seeder sogis/wmts-seeder
```

Interne QGIS-Projekt-Dateien verwenden:
```
docker run -p 80:80 -v /Volumes/Samsung_T5:/geodata -e QGIS_FCGI_MIN_PROCESSES=4 -e QGIS_FCGI_MAX_PROCESSES=4 sogis/wmts-seeder --rm --name wmts-seeder sogis/wmts-seeder
```

Tiles-Verzeichnis mounten:
```
docker run -p 80:80 -v /Volumes/Samsung_T5:/geodata:cached -v /Users/stefan/tmp/tiles:/tiles:cached -e QGIS_FCGI_MIN_PROCESSES=6 -e QGIS_FCGI_MAX_PROCESSES=6 --rm --name wmts-seeder sogis/wmts-seeder
```

In Container einloggen:
```
bash -c "clear && docker exec -it wmts-seeder /bin/bash"
```

Seeden (vorgängig Container starten):
```
docker exec -it wmts-seeder mapcache_seed -c /mapcache/mapcache.xml -t ch.so.agi.hintergrundkarte_ortho -f -z 11,14 -n 4 -d /data/wmts-seeding-perimeter.gpkg -l kanton1000m


```

Ausgeführte Befehle:
```
docker exec -it wmts-seeder mapcache_seed -c /mapcache/mapcache.xml -t ch.bl.agi.lidar_2018.dsm_hillshade -f -z 0,14 -n 4
docker exec -it wmts-seeder mapcache_seed -c /mapcache/mapcache.xml -t ch.so.agi.hintergrundkarte_ortho -f -z 0,14 -n 6 -d /data/wmts-seeding-perimeter.gpkg -l kanton1000m
docker exec -it wmts-seeder mapcache_seed -c /mapcache/mapcache.xml -t ch.bl.agi.lidar_2018.dtm_hillshade -f -z 0,14 -n 2
docker exec -it wmts-seeder mapcache_seed -c /mapcache/mapcache.xml -t ch.bl.agi.lidar_2018.ndsm_buildings -f -z 0,14 -n 4
docker exec -it wmts-seeder mapcache_seed -c /mapcache/mapcache.xml -t ch.bl.agi.lidar_2018.ndsm_vegetation -f -z 0,14 -n 6


```

## Prozess

- Speicherort von *.qgs: im /vagrant Ordner? Ggf. docker build kopiert es rein.
- QML trotzdem abspeichern. Master ist aber Projekt.
- ....


- Wichtig: es muss nachvollziehbar und technisch durchführbar sein für andere Mitarbeiter


## TODO
- Installieren von Fonts (Frutiger und Cadastra) analog Docker.
- QGIS config nach `.local/share` kopieren.
- Kantonsgrenze: Probleme mit Geopackage (!?) -> Darf QGIS Server nicht laufen, wenn wir was am Projekt ändern? Resp. Projekt darf nicht im QGIS Desktop nicht neu geladen werden, solange QGIS Server läuft.
- tbd: https://mapserver.org/mapcache/config.html -> falls keine `auto_expire` gesetzt ist, laufen die Kacheln nicht ab und es finden keine WMS-Requests statt. Verstehe ich das richtig?
- Wie testen? a) man sieht keine qgs_mapserv prozesse mehr b) testen mit purem mapcache image...