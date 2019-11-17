# isf-ng-qual-2019

### Условие задачи

Разработать одностраничное приложение на `Dart Angular`, отображающее time line изменения статусов объектов.

Данные поступают с сервера ассинхронно в json следующего формата:

```
{
    "method": "obj_state",
    "params": {
        "timestamp": "1527695102",
        "obj_name": "Наименование объекта",
        "obj_id": "12345",
        "items": {
            "state": "Состояние 1",
            "progress": "37%"
        }
    }
}
```

Предполагается, что все параметры передаются обязательно. Количество
и наименования состояний и объектов необходимо определить самостоятельно.
По мере поступления информации о статусах абонентов масштабировать time line
пропорционально временным интервалам.

### Сборка и запуск

Начать сборку:
```
webdev build
```

Запустить приложение:
```
webdev serve
```

### Серверная часть
Серверная часть доступна в отдельном Github-репозитории: [isf-ws-qual-2019](https://github.com/victorivanovspb/isf-ws-qual-2019)

### Внутренее устройство
Веб-приложение использует [AngularDart](https://webdev.dartlang.org/angular) и [AngularDart Components](https://webdev.dartlang.org/components)
и основано на одном из шаблонов, доступных в `stagehand` под [лицензией BSD](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

### Обратная связь
[github.com/victorivanovspb/isf-ng-qual-2019/issues](https://github.com/victorivanovspb/isf-ng-qual-2019/issues)
