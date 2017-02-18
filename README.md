[![Build Status](https://travis-ci.org/AlexeyKot/flashcards.svg?branch=master)](https://travis-ci.org/AlexeyKot/flashcards)

# Задание 1: Простейший RoR контроллер

# Задание 2: Добавляем первую модель

## Вопросы и ответы

**1. Что делают миграции?**

Миграции отражают изменения модели в базе данных

**2. Как избежать генерации лишних resource-роутов, если у тебя есть только метод #show в контроллере?**

Использовать одиночные ресурсы, пример из документации
`get 'profile', to: 'users#show'`

# Задание 3: Добавляем и удаляем карточки

## Вопросы и ответы

**1. Что такое DRY? Как ты следуешь DRY в новом контроллере?**

DRY означает _Don't Repeat Yourself_, т.е. в случае с кодингом, если мы пишем один и тот же код несколько раз, стоит задуматься о том, чтобы вынести такие куски кода в отдельные функции/классы/объекты, чтобы ссылаться всегда на них. Это ведет к меньшему количеству ошибок в коде и оптимизирует процесс разработки, так как код в одном месте проще поддерживать.

В нашем cards-контроллере на данном этапе мы задействуем принцип DRY, когда вынесли отдельную private функцию `card_params`, которая регулирует входящие параметры объекта.

**2. Что такое `partials`? Пригодятся ли они тебе в этом задании?**

`partials` это _view_ы многократного использования, то есть куски _view_, которые мы можем вставлять в других _view_, следуя принципу DRY.

В этом задании я использовал `partials` чтобы показать отдельные флэшкарты в разных местах, в частности `index view` и `show view`.

**3. Что такое REST?**

_В общем случае REST является очень простым интерфейсом управления информацией без использования каких-то дополнительных внутренних прослоек. Каждая единица информации однозначно определяется глобальным идентификатором, таким как URL. Каждая URL в свою очередь имеет строго заданный формат._

# Задание 4: Добавляем и удаляем карточки

## Вопросы и ответы

**1. Что такое xpath? Чем он лучше CSS селекторов? Как получить\скопировать xpath\css путь к DOM элементу (div, h2) в консоле браузера? В качестве ответа приложите скриншот.**

_Xpath_ — это язык запросов к элементам xml или xhtml документа.
Лучше CSS он тем, что позволяет находить на странице даже те элементы, которые не имеют каких-либо явных характеристик, типа class или id, например, по содержимому. Ответ на последний вопрос:
![Image](https://pp.vk.me/c836333/v836333517/186af/7EFKKSqefq0.jpg)

# Задание 5: Простой тренировщик

## Вопросы и ответы

**1. Где нужно хранить бизнес-логику, типа проверки перевода?**

В модели.

**2. Что такое params ?**

C помощью _params_ мы можем передавать с помощью POST и GET запросов данные в контроллер.

**3. Как в PostgreSQL получить случайную запись?**

С помощью функции ```random()```

```
SELECT * FROM tablename ORDER BY random() LIMIT 3;
```

# Задание 6: Простой тренировщик

**1. Зачем писать тесты?**

Чтобы автоматически проверять качество кода, находить в нём ошибки, писать более качественный код. Также автоматические тесты могут предупредить об ошибках, которые могут возникнуть в коде в будущем после его изменения.

**2. Что такое юнит-тесты? Можно ли отнести тесты модели к юнит-тестам?**

Юнит-тесты это тесты, покрывающие отдельные модули кода (функции, методы и т.д.). То есть с помощью юнит-тестов, мы проверяем наш код по функциональным кусочкам. И тесты модели, разумеется, к юнит-тестам тоже относятся.

# Задание 7: Feature specs и TravisCI

**В чём преимущества feature specs над тестами модели (unit tests)?**

feature specs позволяют тестировать реальное взаимодействие пользователя с веб-приложением. Они также сразу покрывают проверку всей системы в целом, а не отдельных её компонентов.

# Задание 8: Простые ассоциации и вторая модель

**В каких случаях имеет смысл использовать has_many through, а не has_and_belongs_to_many ?**

Имеет смысл тогда, когда нам, возможно, понадобится работать с создаваемой в таком случае промежуточной моделью, делать там валидации, колбеки и прочее. Честно говоря, читанул это в документации. Надо будет практиковаться, чтобы почувствовать :)
