class CardFactory{
    constructor(dataElement) {
        this.element = dataElement; // L'objet de donnée complet
    }
    createCard() {
        const cardElement = document.createElement('section');
        cardElement.id = `${this.element.id}-cardElement`;
        cardElement.classList.add('card-content');
        cardElement.innerHTML = `
        <div>
            <h2 class="card-title">${this.element.balise}</h2>
            <p class="card-section">${this.element.section}</p>        
        </div>        
        `;
        return cardElement;
    }
}
export default CardFactory