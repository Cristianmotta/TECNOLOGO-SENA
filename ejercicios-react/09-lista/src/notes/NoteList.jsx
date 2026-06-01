import Note from "./Note";
import { useContext } from "react";
import { NotesContext } from "../context/NotesContext";

function NotesList() {
    const { notes } = useContext(NotesContext);
    return (
        <div>
            <p style={{textAlign: "right" }}>Tines {notes.length} notas guardas</p>
            {
                notes.map(note => <Note key={note.id} title={note.title} message={note.message} />)
            }
        </div>
    );
}

export default NotesList;