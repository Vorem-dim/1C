﻿Функция ПолучениеЦены(Категория) Экспорт
	Данные = РегистрыСведений.СтоимостьУслуги.СоздатьНаборЗаписей();
	Данные.Прочитать();
	Для каждого Запись из Данные Цикл
		Если Запись.КатегорияУслуги = Категория Тогда
			Возврат Запись.Цена;
		КонецЕсли;
	КонецЦикла;
	Возврат Ложь;
КонецФункции