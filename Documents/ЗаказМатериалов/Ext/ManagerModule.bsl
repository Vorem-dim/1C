﻿Процедура Печать(ТабДок, Ссылка) Экспорт
	Макет = Документы.ЗаказМатериалов.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ЗаказМатериалов.Дата,
	|	ЗаказМатериалов.Заказ,
	|	ЗаказМатериалов.Категория,
	|	ЗаказМатериалов.Номер,
	|	ЗаказМатериалов.ПереченьТребуемыхМатериалов.(
	|		НомерСтроки,
	|		Материал,
	|		Количество,
	|		Единицы,
	|		Цена,
	|		Стоимость
	|	)
	|ИЗ
	|	Документ.ЗаказМатериалов КАК ЗаказМатериалов
	|ГДЕ
	|	ЗаказМатериалов.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьПереченьТребуемыхМатериаловШапка = Макет.ПолучитьОбласть("ПереченьТребуемыхМатериаловШапка");
	ОбластьПереченьТребуемыхМатериалов = Макет.ПолучитьОбласть("ПереченьТребуемыхМатериалов");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ТабДок.Вывести(ОбластьПереченьТребуемыхМатериаловШапка);
		ВыборкаПереченьТребуемыхМатериалов = Выборка.ПереченьТребуемыхМатериалов.Выбрать();
		Пока ВыборкаПереченьТребуемыхМатериалов.Следующий() Цикл
			ОбластьПереченьТребуемыхМатериалов.Параметры.Заполнить(ВыборкаПереченьТребуемыхМатериалов);
			ТабДок.Вывести(ОбластьПереченьТребуемыхМатериалов, ВыборкаПереченьТребуемыхМатериалов.Уровень());
		КонецЦикла;

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	Итоги = Макет.ПолучитьОбласть("Всего");
	СсылкаДокумента = Ссылка[0];
	Итоги.Параметры.Итог = СсылкаДокумента.ПереченьТребуемыхМатериалов.Итог("Стоимость");
	ТабДок.Вывести(Итоги);
КонецПроцедуры
