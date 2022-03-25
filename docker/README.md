## 🪖 Docker

Установить [Docker](https://docs.docker.com/get-docker/) и запустить команду:  
  

```shell
docker run -it --rm --pull always ghcr.io/theorlovsky/auto_mhddos:experimental

```
(кол-во потоков по умолчанию = 1000):


### Команды docker для разного железа: 

-- Слабое (2 ядра + 2-4 ГБ Озу).


```shell
docker run -it --rm --pull always ghcr.io/theorlovsky/auto_mhddos:experimental --parallel 1 -t 500
```
  
-- Среднее (4 ядра + 4-8 Гб Озу) .Эти же параметры использутся по умолчанию, если запускать команду без аргументов.:   
  

```shell
docker run -it --rm --pull always ghcr.io/theorlovsky/auto_mhddos:experimental --parallel 2 -t 1000
```
  
-- Быстрое(4+ ядер + 8+ Гб Озу):  

  
```shell
docker run -it --rm --pull always ghcr.io/theorlovsky/auto_mhddos:experimental --parallel 2 -t 2000
```  
Разъяснение:
  
`--parallel 2` - запускается 2 копии mhddos_proxy.  

  
`-t 1000` - количество потоков (threads) = 1000. Параметр -t в mhddos_proxy.  
  

Пример успешной атаки без третьего параметра --debug(больше ничего выводится не будет):  
![Стандартный вывод](https://user-images.githubusercontent.com/74729549/159160084-3ffd870b-7d17-44c9-9108-3908212402ce.png)  


ТАКЖЕ МОЖНО ДОБАВИТЬ В КОНЕЦ ТРЕТИЙ ПАРАМЕТР --debug , чтоб выводилась информация о каждом отправленном пакете,  
например:  
```shell
docker run -it --rm --pull always ghcr.io/aruiem234/auto_mhddos:latest 500 100 --debug  
```
пример вывода с параметром --debug:  
![Параметр --debug](https://user-images.githubusercontent.com/74729549/159160027-dcc51f91-3d0b-4dd7-abe8-b63edf136e1e.png)  
  
  