import { useState } from "react";

const LOCALSTORAGE_KEY = "MIAPP.list";

function useNotes() {
    const [notes, setNotes] = useState([]);

    function add(noteObj) {
        const id = Date.now();
        const newObject = { title, message, id };
        setNotes([ newObject, ...notes ]);
    }

    return {
        notes,
        add
    }
}

export default useNotes;