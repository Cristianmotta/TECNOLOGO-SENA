
function Note({title, message}) {
    return (
        <div className="note">
            <h3>{title}</h3>
            <p>{message}</p>
        </div>
    );
}

export default Note;