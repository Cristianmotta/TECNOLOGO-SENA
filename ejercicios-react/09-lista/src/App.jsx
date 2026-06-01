import { NotesProvider } from './context/NotesContext'
import NotesList from './notes/NoteList'
import NotesForm from './notes/NotesForm'

function App() {
  return (
    <div className="App">
      <NotesProvider>
        <NotesForm />
        <NotesList />
      </NotesProvider>
    </div>
  )
}

export default App
