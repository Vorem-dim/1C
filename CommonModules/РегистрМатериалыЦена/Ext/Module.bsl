﻿Функция ПолучениеЦены(Материал) Экспорт
	Данные = РегистрыСведений.СведеньяМатериалы.СоздатьНаборЗаписей();
	Данные.Прочитать();
	Для каждого Запись из Данные Цикл
		Если Запись.Материал = Материал Тогда
			Возврат Запись.Цена;
		КонецЕсли;
	КонецЦикла;
	Возврат Ложь;
КонецФункции