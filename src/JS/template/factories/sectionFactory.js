class SectionFactory {
    constructor(sectionData) {
        // this.name est 'syntaxe' ou 'attributs'
        this.name = sectionData.name;
        // this.data est le tableau d'objets (ex : [{name: 'autoplay', ...}, ...])
        this.data = sectionData.data;
    }

    createSection() {
        const section = document.createElement('section');

        // CORRECTION 1 : Utiliser this.name pour l'ID et la classe
        section.id = `section-${this.name}`;
        section.classList.add(`section-${this.name}`);

        // CORRECTION 2 : Utiliser this.name pour le titre H2
        let sectionContent = `
            <h2 class="${this.name}_title">${this.name.charAt(0).toUpperCase() + this.name.slice(1)}</h2>
            <div class="section_content">
        `;

        this.data.forEach((item) => {
            if (this.name === 'syntaxe') {
                sectionContent += `
                    <div class="syntaxe_block">
                        <h3 class="syntaxe_block-title">${item.titre}</h3>
                        <pre><code>${item.code}</code></pre>
                    </div>`;

            } else if (this.name === 'attributs') {

                // 1. Gérer la liste des valeurs
                let valeursHtml = '';
                if (item.valeurs && Array.isArray(item.valeurs) && item.valeurs.length > 0) {
                    const listeItems = item.valeurs.map(val => `<li>${val}</li>`).join('');
                    valeursHtml = `<div class="attribut_valeurs-container">
                                        <h4>Valeurs possibles :</h4>
                                        <ul class="attribut_valeurs-list">${listeItems}</ul>
                                   </div>`;
                }

                // 2. Assembler le bloc HTML de l'attribut avec une structure sémantique <dl>
                sectionContent += `
                    <dl class="attribut-definition-list">
                        <dt class="attribut_name">
                            ${item.name} 
                            <span class="attribut_type">(${item.type})</span>
                        </dt>
                        <dd class="attribut_description">${item.description}</dd>
                        <dd class="attribut_valeurs-section">
                            ${valeursHtml}
                        </dd>
                    </dl>
                `;
            }
        });

        sectionContent += `</div>`;

        // AJOUT : Affecter le contenu à l'élément section
        section.innerHTML = sectionContent;

        return section;
    }
}

export default SectionFactory;