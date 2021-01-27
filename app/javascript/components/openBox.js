const openBox = () => {
    const box = document.querySelector('.select2-container')
    if (box) {
        box.classList.add('select2-container--open');
    }
}


export { openBox };