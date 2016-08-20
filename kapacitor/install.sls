{% from "kapacitor/map.jinja" import kapacitor with context %}

kapacitor-pkg:
  file.managed:
    - name: /tmp/kapacitor_{{ kapacitor.version }}{{ kapacitor.pkgsuffix }}
    - source: {{ kapacitor.source_url }}{{ kapacitor.version }}{{ kapacitor.pkgsuffix }}
    - source_hash: md5={{ kapacitor.source_hash }}
    - unless: test -f /tmp/kapacitor_{{ kapacitor.version }}{{ kapacitor.pkgsuffix }}

kapacitor-install:
  pkg.installed:
    - sources:
      - kapacitor: /tmp/kapacitor_{{ kapacitor.version }}{{ kapacitor.pkgsuffix }}
    - require:
      - file: kapacitor-pkg
    - watch:
      - file: kapacitor-pkg
