﻿&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Клиент = РегистрыСведений.Клиент.СоздатьМенеджерЗаписи();
	Клиент.Период = ТекущаяДата();
	Клиент.ФИО = Объект.Наименование;
	Клиент.ДатаРождения = Объект.ДатаРождения;
	Клиент.Телефон = Объект.Телефон;
	Клиент.ЭлПотча = Объект.ЭлПочта;
	Клиент.ПерсональнаяСкидка = 0;
	Клинт = РегистрыСведений.Клиент.СоздатьНаборЗаписей();
	Клинт.Прочитать();
	индекс = 0;
	Пока индекс < Клинт.Количество() Цикл
		Если Не (Клинт[индекс].ФИО = Клиент.ФИО И Клинт[индекс].ДатаРождения = Клиент.ДатаРождения) Тогда
			Клиент.Записать();
			Возврат;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

