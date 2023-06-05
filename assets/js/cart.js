import Fetcher from './fetcher';

(() => {
    'use strict';

    const addCartButtonEvents = () => {
        document.querySelectorAll('.btn-cart').forEach(element => {
            element.addEventListener('click', (e) => {
                Fetcher.post('/carts/add', {
                    productId: e.currentTarget.getAttribute('data-pid'),
                })
            })
        })
    }

    console.log(location);

    addCartButtonEvents();
})();