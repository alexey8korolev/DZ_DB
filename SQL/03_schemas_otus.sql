-- создание отдельной схемы под таблицы с доступом lOtus

CREATE SCHEMA otus
    AUTHORIZATION "lOtus";

GRANT ALL ON SCHEMA otus TO "lOtus";