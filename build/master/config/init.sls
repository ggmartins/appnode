/tmp/salt.config.version:
  file.managed:
    - source: salt://tmp/salt.config.version
    - user: root
    - group: root
    - mode: 644

/opt/appnode/images/load/ggmartins-bismark_armhf.tar:
  file.managed:
    - source: salt://ggmartins-bismark_armhf.tar
    - user: root
    - group: root
    - mode: 644

/opt/appnode/images/load/ggmartins-seattle_armhf.tar:
  file.managed:
    - source: salt://ggmartins-seattle_armhf.tar
    - user: root
    - group: root
    - mode: 644
