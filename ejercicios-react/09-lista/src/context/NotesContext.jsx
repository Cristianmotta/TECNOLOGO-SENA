import { createContext, useState } from 'react'
import useNotes from '../hooks/useNotes';

export const NotesContext = createContext();

export function NotesProvider({ children }){
    const { notes, add } = useNotes();
    return(
        <NotesContext.Provider value={{notes, add}}>
            { children}
        </NotesContext.Provider>
    )
}
