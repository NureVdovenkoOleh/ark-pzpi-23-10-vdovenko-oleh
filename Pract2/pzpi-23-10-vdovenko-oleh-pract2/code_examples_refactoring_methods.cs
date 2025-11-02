// --- В.1 Метод "Replace Type Code with State/Strategy" – "До" рефакторингу ---

public List FilterCuriosities( 
    string searchText, string searchCriteria) 
{ 
    switch (searchCriteria) 
    { 
        case "Текст": 
            return curiosities.Where(c => 
                c.Text.Contains(searchText)); 
        case "Автор": 
            return curiosities.Where(c => 
                c.Author.Contains(searchText)); 
        case "Тип": 
            return curiosities.Where(c => 
                c.Type.Contains(searchText)); 
    } 
} 

// --- В.2 Метод "Replace Type Code with State/Strategy" – "Після" рефакторингу ---

public interface ISearchStrategy 
{ 
    List Search(string searchText, 
        List curiosities); 
} 

public class TextSearch : ISearchStrategy 
{ 
    public List Search(string 
        searchText, 
        List curiosities) 
    { 
        return curiosities.Where(c => 
            c.Text.Contains(searchText)).ToList(); 
    } 
} 
//Так же само для AuthorSearch, TypeSearch


// --- В.3 Метод "Separate Query from Modifier" – "До" рефакторингу ---

public Curiosity GetRandom() 
{ 
    actionHistory.AddAction("Отримано випадковий 
        курйоз"); 
    // МЕТОД І ПОВЕРТАЄ ДАНІ, І ЗМІНЮЄ СТАН! 
    Random random = new Random(); 
    int index = random.Next(curiosities.Count); 
    return curiosities[index]; 
} 

// --- В.4 Метод "Separate Query from Modifier" – "Після" рефакторингу ---

// ЗАПИТ - тільки повертає дані 
public Curiosity GetRandomCuriosity() 
{ 
    Random random = new Random(); 
    int index = random.Next(curiosities.Count); 
    return curiosities[index]; 
} 

// МОДИФІКАТОР - тільки змінює стан 
public void LogRandomAccess() 
{ 
    actionHistory.AddAction("Отримано випадковий 
        курйоз"); 
} 

// ВИКОРИСТАННЯ: 
var randomCuriosity = GetRandomCuriosity(); 
LogRandomAccess(); 


// --- В.5 Метод "Preserve Whole Object" – "До" рефакторингу ---

public List FilterCuriosities( 
    string searchText, 
    string searchCriteria, 
    bool filterByFavorites = false) 
// багато параметрів - складно читати 
{
    // ...
}

// --- В.6 Метод "Preserve Whole Object" – "Після" рефакторингу ---

public class SearchParameters 
{ 
    public string SearchText { get; set; } 
    public SearchCriteria Criteria { get; set; } 
    public bool FilterByFavorites { get; set; } 
    // Легко додати: public DateTime DateFrom { get; set; }  
} 

public List FilterCuriosities(SearchParameters parameters) 
// один параметр - просто та зрозуміло 
{
    // ...
}
