kapacitor-service:
  service.running:
    - name: kapacitor
    - enable: True
    - watch:
      - sls: kapacitor.install
      - sls: kapacitor.config
    - require:
      - sls: kapacitor.install
      - sls: kapacitor.config
