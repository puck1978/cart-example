export default class Fetcher
{
    static otp = null
    static error = null
    static isLoading = false
    static baseUrl = window.location.protocol + '//' + window.location.hostname

    /**
     * has request an error message
     * @returns {boolean}
     */
    static hasError()
    {
        return this.error !== null;
    }

    /**
     * get error object
     * @returns {object}
     */
    static getError()
    {
        return this.error;
    }

    /**
     * Get request per fetch
     * @param {string} uri
     * @param {function|null} callBack
     * @param {function|null} errorCallBack
     * @param {boolean} disableLoadingAnimation
     */
    static get(
        uri,
        callBack = null,
        errorCallBack = null,
        disableLoadingAnimation = true
    ) {
        this.#request(uri, null, callBack, errorCallBack, 'GET', disableLoadingAnimation);
    }

    /**
     * POST request per fetch
     * @param {string} uri
     * @param {object} data
     * @param {function|null} callBack
     * @param {function|null} errorCallBack
     * @param {boolean} disableLoadingAnimation
     */
    static post(
        uri,
        data,
        callBack = null,
        errorCallBack = null,
        disableLoadingAnimation = true
    ) {
        this.#request(uri, data, callBack, errorCallBack, 'POST', disableLoadingAnimation);
    }

    /**
     * PUT request per fetch
     * @param {string} uri
     * @param {object} data
     * @param {function|null} callBack
     * @param {function|null} errorCallBack
     * @param {boolean} disableLoadingAnimation
     */
    static put(
        uri,
        data,
        callBack = null,
        errorCallBack = null,
        disableLoadingAnimation = true
    ) {
        this.#request(uri, data, callBack, errorCallBack, 'PUT', disableLoadingAnimation);
    }

    /**
     * PUT request per fetch
     * @param {string} uri
     * @param {object} data
     * @param {function|null} callBack
     * @param {function|null} errorCallBack
     * @param {boolean} disableLoadingAnimation
     */
    static delete(
        uri,
        data,
        callBack = null,
        errorCallBack = null,
        disableLoadingAnimation = true
    ) {
        this.#request(uri, data, callBack, errorCallBack, 'DELETE', disableLoadingAnimation);
    }


    static #request(
        uri,
        data = null,
        callBack = null,
        errorCallBack = null,
        _method = 'POST',
        disableLoadingAnimation = true
    ) {
        this.error     = null;
        this.isLoading = true;

        const attr = document.querySelector('meta[name="csrf-token"]')
        const csrfToken = !!attr && attr.getAttribute("content")
            ? attr.getAttribute("content")
            : '';

        const requestHeaders = {
            "Content-Type": "application/json",
            "X-Requested-With": "XMLHttpRequest",
            "X-CSRF-TOKEN": csrfToken,
            "Accept": "application/json",
        };

        const requestOptions = {
            method: _method.toLowerCase(),
            headers: requestHeaders
        }

        if (data !== null) {
            requestOptions.body = JSON.stringify(data);
        }

        const url = uri.includes(this.baseUrl)
            ? uri
            : this.baseUrl + uri;

        fetch(url , requestOptions)
            .then(async response => {
                const jsonData = await response.json().catch(() => ({}))
                this.isLoading = ! disableLoadingAnimation;

                // check for error response
                if (!response.ok) {
                    // get error message from body or default to response status
                    const error = jsonData || response.status;

                    return errorCallBack instanceof Function
                        ? errorCallBack(error)
                        : Promise.reject(error);
                }

                if (!! jsonData && !!jsonData.token) {
                    this.otp = jsonData.token;
                }

                if (callBack instanceof Function) {
                    callBack(jsonData);
                } else {
                    return jsonData;
                }
            })
            .catch(error => {
                this.isLoading = false;

                if (! errorCallBack) {
                    const message = ["Es ist ein Fehler aufgetreten."];

                    if (Object.hasOwn(error, 'message')) {
                        if (!! error.response && !! error.response.data && !! error.response.data.message) {
                            message.push(error.response.data.message)
                        } else {
                            message.push(error.message);
                        }
                    }

                    this.error = message.join("<br/>");
                }
            });
    }
}