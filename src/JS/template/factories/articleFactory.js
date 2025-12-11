import SectionFactory from './sectionFactory.js'; // Le nom d'import doit correspondre à l'export

class ArticleFactory{
    // Ajout de vueType au constructeur
    constructor(articleData, vueType) {
        this.data = articleData; // L'objet complet de la balise (ex : {balise : "audio", syntaxe : [...], ...})
        this.vueType = vueType;  // Le type de vue requis ('syntaxe' ou 'attributs')
    }

    createArticle() {
        const articleElement = document.createElement('article');

        // CORRECTION 1 : Utilisez les bonnes clés de données pour l'ID et le titre.
        // J'utilise 'balise' pour l'ID et 'balise' pour le titre H1 
        articleElement.id = `article-${this.data.balise}`;
        articleElement.classList.add(`article-${this.data.balise}`);

        // Contenu statique
        articleElement.innerHTML = `
        <header class="articleHeader">
             <h1 class="elementName">${this.data.balise}</h1>
        </header>
        <section class="description">
            <h2 class="description_title">Description</h2>
            <div class="description_container">
                <p class="description_container-text">${this.data.description}</p>
            </div>        
        </section>                                  
        `;

        // --- LA LOGIQUE DE CHOIX TERNAIRE EST ICI ---
        const donneesDynamiques =
            this.vueType === 'syntaxe'
                ? this.data.syntaxeFormated  // Si 'syntaxe', on prend ce tableau
                : this.data.attributsFormates; // Sinon, on prend cet autre tableau


        // Création de la SectionFactory avec les données filtrées
        const sectionFactory = new SectionFactory({
            name: this.vueType,
            data: donneesDynamiques
        });

        // Ajout de l'élément section à l'article
        articleElement.appendChild(sectionFactory.createSection());

        return articleElement;
    }
}
export default ArticleFactory;