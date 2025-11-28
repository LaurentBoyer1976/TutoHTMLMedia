import Api from './API/Api.js';
import htmlElement from '../JS/template/constructor/constructorPattern.js';
import MainFactory from '../JS/template/factories/mainFactory.js'; // ⬅️ 1. Import de la MainFactory

const elementsApi = new Api('src/datas/Json/datas.json');


const init = async () => {
    console.log(elementsApi)
    const elementsData = await elementsApi.get();

    // Gérer le cas où la récupération des données échoue
    if (!elementsData || !elementsData.elements) {
        console.error("Impossible de charger les données des éléments.");
        return;
    }

    const elements = elementsData.elements;
    console.log(elementsData, elements);

    // Définir la vue que l'on souhaite afficher pour tous les éléments.
    // Cette valeur devrait idéalement venir d'un paramètre utilisateur (ex: un bouton cliqué).
    const VUE_ACTUELLE = 'attributs'; // Choisissez 'syntaxe' ou 'attributs'

    const elementsFormates = elements
        // 2. Formater chaque élément JSON brut en utilisant votre Constructeur
        .map(element => new htmlElement(element));

    // 3. Boucler sur les éléments formatés et utiliser la MainFactory pour l'affichage
    elementsFormates.forEach(elementFormate => {
        console.log("Element formaté pour la Factory:", elementFormate);

        // Créer l'élément principal via la Factory
        const mainFactory = new MainFactory(elementFormate, VUE_ACTUELLE);
        const elementDOM = mainFactory.createMain();

        // Ajouter l'élément au corps du document (ou à un conteneur spécifique)
        document.body.appendChild(elementDOM);
    });
}

init();