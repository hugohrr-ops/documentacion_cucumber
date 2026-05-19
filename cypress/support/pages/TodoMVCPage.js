export class Tareas {
    
    constructor() {
        this.web = 'https://www.todomvc.com/examples/react/dist/';
        this.tarea = '[data-testid="todo-item-label"]';
        this.listaTareas = '.todo-list li';
        this.crearTarea = '.new-todo';
        this.editarTarea = '[data-testid="text-input"]';
        this.eliminarTarea = ':nth-child(1) > .view > .destroy';
        this.completarTarea = '[data-testid="todo-item-toggle"]';
        this.filtroTodas = '[data-testid="footer-navigation"] a:contains("All")';
        this.filtroActivas = '[data-testid="footer-navigation"] a:contains("Active")';
        this.filtroCompletadas = '[data-testid="footer-navigation"] a:contains("Completed")';
    }

    entrarWeb() {
        cy.visit(this.web);
    }

    crear(nombre) {
        cy.get(this.crearTarea).type(nombre + '{enter}');
    }

    marcar(index) {    
        cy.get(this.completarTarea).eq(index-1).click();
    }

    editar(nuevoNombre, index) {
        cy.get(this.listaTareas).eq(index-1).dblclick();
        cy.get(this.listaTareas).eq(index-1).find(this.editarTarea).type(nuevoNombre + '{enter}');
    }

    eliminar() {
        cy.get(this.eliminarTarea).click({ force: true });
    }

    filtrarActivas() {
        cy.get(this.filtroActivas).click();
    }

    filtrarCompletadas() {
        cy.get(this.filtroCompletadas).click();
    }

    filtrarTodas() {
        cy.get(this.filtroTodas).click();
    }

    esNombre(nombre, index) {
        cy.get(this.tarea).eq(index-1).should('contain', nombre);
    }

    esActiva(index) {
        cy.get(this.listaTareas).eq(index-1).should('not.have.class', 'completed');
    }

    esCompletada(index) {
        cy.get(this.listaTareas).eq(index-1).should('have.class', 'completed');
    }

    esInexistente(index) {
        cy.get(this.tarea).should('not.exist');
    }

}

export const gestionTareas = new Tareas();