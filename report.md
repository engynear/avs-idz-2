# **Отчет о выполнении Домашнего задания №2**

## Вариант 27

# Условие задачи

Разработать программу, которая определяет частоту встречаемости (сколько раз встретилось в тексте) пяти ключевых
слов языка программирования C, в произвольной ASCII-строке.
Ключевые слова не должны являться частью идентификаторов.
Пять искомых ключевых слов выбрать по своему усмотрению.
Тестировать можно на файлах программ.


# На 4 балла

### Привести решение на языке C

Решение представленно в файле main.c

- [Основной файл](./main.c)

### Комментарии в ассемблер

В ассемблер-файлах написаны комметарии, представляющие описание комманд ассемблера.

- [Ассемблер-код основного файла](./main.s)

### Компиляция 
Программа была откомпелированна с помощью флагов:
```
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./main.c \
    -S -o ./main.s
```

Файл собран в объектный:

`gcc ./main.c -c -o ./main.o`

Линковка программы:

`gcc main.o -o main.exe`

### Тесты
Тестовое покрытие находится в [папке тестов](./tests/)

Входные данные имеют расширение **.in**

Выходные данные имеют расширение **.out**

Результаты тестовых прогонов совпали с ожидаемыми выходными данными.

---
