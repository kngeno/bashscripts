#!/usr/bin/env bash

URL='http://maps.virtualkenya.org/geoserver/ows?service=wfs&version=1.1.0&typename=geonode:nairobi_suburbs_maramoja&request=getfeature&CQL_FILTER=INTERSECTS(the_geom,POINT(-1.2975676%2036.7767726))&outputFormat=json'

# only output error messages
curl -s -S -f $URL > /dev/null

if [ $? -ne 0 ]; then
  date
  echo "Restarting suburb service."
  service tomcat7 restart;
  echo
fi
