import ArticleFactory from './articleFactory.js';

class MainFactory {
    // Le constructeur reçoit l'objet de données complet (ex : balise 'audio')
    // et le type de vue souhaité ('syntaxe' ou 'attributs').
    constructor(dataElement, vueType) {
        this.element = dataElement; // L'objet de donnée complet
        this.vueType = vueType;     // Le choix : 'syntaxe' ou 'attributs'
    }

    createMain() {
        const mainElement = document.createElement('main');
        mainElement.id = this.element.id || 'main-content';
        mainElement.classList.add('main-content');

        // --- Implémentation de l'ArticleFactory ---

        // 1. Créer une instance de l'ArticleFactory, en lui passant :
        //    a) L'objet de données complet (this.element)
        //    b) Le type de vue (this.vueType)
        const articleFactory = new ArticleFactory(this.element, this.vueType);

        // 2. Construire l'élément <article> et l'ajouter à <main>
        mainElement.appendChild(articleFactory.createArticle());



        return mainElement;
    }
}
export default MainFactory;