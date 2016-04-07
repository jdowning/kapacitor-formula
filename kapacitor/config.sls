{% from "kapacitor/map.jinja" import kapacitor with context %}

kapacitor-config:
  file.managed:
    - name: /etc/kapacitor/kapacitor.conf
    - source: salt://kapacitor/files/kapacitor.conf
    - user: root
    - group: root
    - mode: 644
    - context:
        kapacitor: {{ kapacitor }}
    - template: jinja
    - require:
      - sls: kapacitor.install
