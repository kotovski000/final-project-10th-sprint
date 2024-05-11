#!/bin/bash

# Создаем каталог task с вложенными директориями
mkdir -p task/dir1 task/dir2 task/dir3/dir4

# Изменяем текущую директорию на task
cd task

# Создаем пустой файл task/dir2/empty
touch dir2/empty

# Создаем файл task/dir2/hello.sh
echo '#!/bin/bash
echo "$1, привет!"' > dir2/hello.sh

# Устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 dir2/hello.sh

# Сохраняем список файлов task/dir2 в task/dir2/list.txt
ls dir2 > dir2/list.txt

# Копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r dir2 dir3/dir4

# Записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
find . -name "*.txt" > dir1/summary.txt

# Дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt

# Определяем переменную окружения NAME со значением "Всем студентам"
export NAME="Всем студентам"

# Запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# Вывод скрипта дописываем в файл task/dir1/summary.txt
./dir2/hello.sh "$NAME" >> dir1/summary.txt

# Перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv dir1/summary.txt "Практическое задание"

# Выводим на консоль содержимое файла task/Практическое задание
cat "Практическое задание"

# Ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем сортируем их
grep "dir" "Практическое задание" | sort

# Меняем текущую директорию на родительскую для task
cd ..

# Удаляем директорию task со всем содержимым
rm -rf task
