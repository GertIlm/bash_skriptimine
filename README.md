# bash_skriptimine

VOCO, IT-süsteemide spetsialist – aine **Skriptimisvahendid**, BASH skriptid.

Autor: Gert Ilm

## Sisu

| Fail | Kirjeldus |
|------|-----------|
| `apache_paigaldus.sh` | BASH haldus – praks2: kontrollib, kas veebiserver **apache2** on paigaldatud; kui ei ole, siis paigaldab, muidu annab teada ja näitab teenuse staatust |

## apache_paigaldus.sh

### Tööpõhimõte

```
            ┌──────────────────────────────┐
            │ Kas apache2 on paigaldatud?  │
            │ dpkg-query ... | grep -c     │
            └──────────────┬───────────────┘
                 ei (0)    │    jah (1)
          ┌────────────────┴────────────────┐
          ▼                                 ▼
 apt-get install apache2       "apache2 on juba paigaldatud"
                               systemctl start + status
```

Paigalduse tuvastamiseks kasutatakse käsku

```bash
dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed"
```

mis tagastab `1`, kui pakett on paigaldatud, ja `0`, kui ei ole.

### Kontrollimine

Skript käivitatakse root kasutajana:

```bash
chmod +x apache_paigaldus.sh
sh apache_paigaldus.sh
```

### Näidiskatsed

Testitud masinas `gert-bash-praks2` (Proxmox LXC 22290, Ubuntu 24.04 LTS):

1. **apache2 ei ole paigaldatud** – skript teatab `apache2 ei ole paigaldatud.`, paigaldab paketi `apt-get install -y apache2` abil ja teatab `apache2 on edukalt paigaldatud.`
2. **apache2 on paigaldatud** – skript teatab `apache2 on juba paigaldatud.` ja näitab `systemctl status apache2` väljundit (`Active: active (running)`).
