class EventEmitter {
    constructor() {
        this._storage = new Map();
    }

    addEventListener(type, handler) {
        if (this._storage.has(type)) {
            this._storage.get(type).push(handler);
        } else {
            this._storage.set(type, [handler]);
        }
    }

    removeEventListener(type, handler) {
        if (this._storage.has(type)) {
            this._storage.set(type, this._storage.get(type).filter((fn) => fn != handler));
            return true;
        }

        return false;
    }

    dispatchEvent(event) {
        if (this._storage.has(event.type)) {
            this._storage.get(event.type).forEach(handler => handler(event));
            return true;
        }

        return false;
    }
}

class JSInteropManager extends EventEmitter {
    constructor() {
        super();

        this.textElement = document.createElement('p')
        this.textElement.textContent = 'This text is rendered on a native web view'
    }

    setTextValue(text) {
        this.textElement.textContent = text;
    }
}

window.IntegrationsNamespace = {
    JSInteropManager
}