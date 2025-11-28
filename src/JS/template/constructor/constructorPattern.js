class htmlElement {
    constructor(data) {

        this.id = data.id;
        this.balise = data.balise;
        this.section = data.section;
        this.description = data.description;
        this.syntaxeFormated = (data.syntaxe || []).map(syntaxeBrut => {
            return {
                titre: syntaxeBrut.titre,
                code: syntaxeBrut.code
            }
        });
        this.attributsFormates = (data.attributs || []).map(attributBrut => {
            return {
                nom: attributBrut.name, // Renommage
                type: attributBrut.type,
                detail: attributBrut.description,
                valeursPermises: attributBrut.valeurs || [] // Gérer la propriété manquante
            };
        });


    }
}
export default htmlElement;