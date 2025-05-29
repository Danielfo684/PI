
export default class HttpClient {
    baseUrl: string | null = null;

    constructor(baseUrl = '') {
        this.baseUrl = baseUrl;
    }

    request(url: string, method: string = 'GET', parameters = {}, headers = {}, callBack: Function) {
        let fullUrl: string = this.baseUrl + url;
        console.log(url);
        console.log(fullUrl);
        const options: RequestInit = {
            method,
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                ...headers
            }
        }
        fetch(fullUrl, options)
            .then(response => {
                if (!response.ok) {
                    return response.json().then(errorData => {
                        throw new Error(errorData.message || 'Unknown error');
                    });
                }
                return response.json();
            })
            .then(data => {
                console.log("Data received from the server:", data);
                callBack(data);
            })
            .catch(error => {
                console.log(url, method, error);
            })
    }
}