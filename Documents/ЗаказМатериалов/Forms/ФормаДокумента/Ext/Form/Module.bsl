﻿&НаКлиенте
Процедура ПереченьТребуемыхМатериаловКоличествоПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элементы.ПереченьТребуемыхМатериалов.ТекущиеДанные;
	СтрокаТабличнойЧасти.Стоимость = СтрокаТабличнойЧасти.Количество * СтрокаТабличнойЧасти.Цена
КонецПроцедуры

&НаСервере
Функция ПереченьТребуемыхМатериаловМатериалПриИзмененииНаСервере(Материал)
	ЦенаМатериала = РегистрМатериалыЦена.ПолучениеЦены(Материал);
	Возврат ЦенаМатериала;
КонецФункции

&НаКлиенте
Процедура ПереченьТребуемыхМатериаловМатериалПриИзменении(Элемент)
	Строка = Элементы.ПереченьТребуемыхМатериалов.ТекущиеДанные;
	ЦенаМатериала = ПереченьТребуемыхМатериаловМатериалПриИзмененииНаСервере(Строка.Материал);
	Строка.Цена = ЦенаМатериала;
	Строка.Стоимость = Строка.Цена * Строка.Количество;
КонецПроцедуры

&НаКлиенте
Процедура Обновить(Команда)
	Для каждого Строка из Объект.ПереченьТребуемыхМатериалов Цикл
		Строка.Цена = ПереченьТребуемыхМатериаловМатериалПриИзмененииНаСервере(Строка.Материал);
		Строка.Стоимость = Строка.Цена * Строка.Количество;
	КонецЦикла;
КонецПроцедуры
