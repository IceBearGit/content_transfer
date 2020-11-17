# Гем содержит метод content_transfer.
Метод принимает на вход строки текста и создает валидный html файл с этими данными. Текст помещается внутри тега <body></body>. 
Метод может принимать дополнительно два опциональных аргумента:
- имя файла (по умолчанию создается index.html)
- агрумент bypass_html, который включает/отключает опцию подавления JS и html. (по умолчанию = false, скрипты и html код передается текстом).

### Пример: content_transfer("<script>alert('you are hacked');</script>", "js", true) - выведет алерт 'you are hacked' на экран, файл будет с названием js.html.
