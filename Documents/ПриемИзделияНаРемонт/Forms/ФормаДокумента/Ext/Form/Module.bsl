﻿&НаКлиенте
Процедура КартинкаНажатие(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = ложь;
    ДиалогОткрытия = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
    ДиалогОткрытия.ПолноеИмяФайла = "";
    ДиалогОткрытия.Фильтр = "Файл JPG, PNG, JPEG |*.jpg; *.png; *.jpeg";
    ДиалогОткрытия.МножественныйВыбор = ложь;
    ДиалогОткрытия.Заголовок = "Выбор изображения";
    ОписаниеОповещения = Новый ОписаниеОповещения("ПослеЗагрузкиФайла", ЭтаФорма); 
    ДиалогОткрытия.Показать(ОписаниеОповещения);
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗагрузкиФайла(ВыбранныйФайл, ДопПараметр)экспорт 
    Если ВыбранныйФайл = Неопределено тогда  
        Возврат;
    Иначе
        ОписаниеОповещения = Новый ОписаниеОповещения("ПослеПеремещенияФайлаНаСервер", ЭтаФорма); 
        НачатьПомещениеФайлаНаСервер(ОписаниеОповещения, , , , ВыбранныйФайл[0], УникальныйИдентификатор);
    КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура ПослеПеремещенияФайлаНаСервер(Результат, Адрес)экспорт
    Если Результат = ложь Тогда
        Возврат;
    Иначе
        Картинка = Результат.Адрес;
        Модифицированность = истина;
    КонецЕсли;    
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ЭтоАдресВременногоХранилища(Картинка) тогда
        ФайлКартинки = ПолучитьИзВременногоХранилища(Картинка);
        ТекущийОбъект.Картинка = Новый ХранилищеЗначения(ФайлКартинки);
        УдалитьИзВременногоХранилища(Картинка);
        Картинка = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "Картинка");
    КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Картинка = ПолучитьНавигационнуюСсылку(Объект.Ссылка, "Картинка");
КонецПроцедуры
