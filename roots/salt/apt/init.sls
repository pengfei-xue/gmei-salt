/etc/apt/apt.conf.d/99local:
  file:
    - managed
    - source: salt://apt/apt.conf
    - user: root
    - group: root
    - mode: 644

/etc/apt/sources.list:
  file:
    - managed
    - source: salt://apt/sources.list
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - countrycode: cn

apt-update:
  cmd:
    - run
    - name: apt-get update
    - require:
      - file: /etc/apt/apt.conf.d/99local
      - file: /etc/apt/sources.list
