#Дан двумерный массив. Создать DataFrame с названиями колонок 'first', 'second', 'third' и вывести только те столбцы, в которых нет значения "None".
import pandas as pd

array = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, None]
]

# Создаем DataFrame с названиями колонок
df = pd.DataFrame(array, columns=['first', 'second', 'third'])

# Выводим только те столбцы, в которых нет значения "None"
result = df.loc[:, df.notnull().all()]

print(result)

#Из словаря (dictionary) нужно получить DataFrame таким образом, чтобы ключи словаря попали в индекс, а значения в колонку 'close'. Преобразовать index в datetime. dct =
#{ '2022.12.01' : 100, '2022.12.02' : 105, '2022.12.03' : 110, '2022.12.04' : 90 }
import pandas as pd

dct = {
    '2022.12.01': 100,
    '2022.12.02': 105,
    '2022.12.03': 110,
    '2022.12.04': 90
}

# Создаем DataFrame
df = pd.DataFrame(list(dct.items()), columns=['date', 'close'])

# Преобразуем индекс в формат datetime
df['date'] = pd.to_datetime(df['date'])
df.set_index('date', inplace=True)

print(df)
