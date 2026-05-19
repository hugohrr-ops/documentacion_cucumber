Feature: Test con POM y Cucumber de TodoMVC

    Background:
        Given entrar en la web

    Scenario: Crear tarea
        When crear una tarea llamada "Tarea 1"
        Then debería verse "Tarea 1" en la lista

    Scenario: Marcar tarea como completada
        Given existe una tarea activa llamada "Tarea 1"
        When marcar la tarea "Tarea 1" como completada
        Then la tarea "Tarea 1" debería mostrarse como completada
    
    Scenario: Desmarcar tarea como completada
        Given existe una tarea completada llamada "Tarea 1"
        When desmarcar la tarea "Tarea 1" como completada
        Then la tarea "Tarea 1" debería mostrarse como activa

    Scenario: Editar tarea existente
        Given existe una tarea activa llamada "Tarea 1"
        When editar la tarea "Tarea 1" por "La tarea ha sido modificada"
        Then debería verse "La tarea ha sido modificada" en la lista

    Scenario: Eliminar tarea existente
        Given existe una tarea activa llamada "Tarea 1"
        When eliminar la tarea "Tarea 1"
        Then la tarea "Tarea 1" no debería mostrarse

    Scenario: Filtrar tareas según su estado
        When crear una tarea llamada "Tarea 1"
        And la tarea "Tarea 1" se muestra como activa
        And crear una tarea llamada "Tarea 2"
        And la tarea "Tarea 2" se muestra como activa
        And crear una tarea llamada "Tarea 3"
        And la tarea "Tarea 3" se muestra como activa
        And crear una tarea llamada "Tarea 4"
        And la tarea "Tarea 4" se muestra como activa
        And marcar la tarea "Tarea 1" como completada
        And marcar la tarea "Tarea 2" como completada
        When activar el filtro "Completed"
        Then deberían mostrarse solo las tareas completadas "Tarea 1" y "Tarea 2"
        When activar el filtro "Active"
        Then deberían mostrarse solo las tareas activas "Tarea 3" y "Tarea 4"
        When activar el filtro "All"
        Then deberían mostrarse las 4 tareas creadas, con su estado correspondiente