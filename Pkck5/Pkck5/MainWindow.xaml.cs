﻿using System.Collections.ObjectModel;
using System.Windows;

namespace Pkck5
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public płytoteka płytoteka { get; set; }
        public XmlUtilities XmlUtilities { get; set; }
        public ObservableCollection<płyta> płytyCollection { get; set; }

        public MainWindow()
        {
            InitializeComponent();

            płytoteka = new płytoteka();

            XmlUtilities = new XmlUtilities("Dokumenty//plytoteka.xml", new string[3]{"Dokumenty//HeaderNamespace.xsd", "Dokumenty//NumericalTypesNamespace.xsd", "Dokumenty//OurNamespace.xsd"});

            OpenApplication();

            płytyListView.ItemsSource = płytyCollection;
            //this.PracownicyListBox.DataContext = Pracownicy;
            //this.DzialyBox.DataContext = Firma.ListaDziałówList.FirstOrDefault().ZdefiniowanyDziałList;
        }


        private void OpenApplication()
        {
            if (!XmlUtilities.XmlFile.Exists)
            {
                MessageBox.Show("Plik " + XmlUtilities.XmlFile.FullName.ToString() + " nie istnieje. \nNic nie załadowano z XMLa", "Błąd przy wczytywaniu pliku!");
            }
            else
            {
                płytoteka = XmlUtilities.LoadData();
                LoadPłytyFromXML();
                MessageBox.Show("Pomyślnie wczytano plik " + XmlUtilities.XmlFile.Name + ". \nDane zostały załadowane");
            }
        }
        private void LoadPłytyFromXML()
        {
            płytyCollection = new ObservableCollection<płyta>();

            foreach (var item in płytoteka.zbiór.płyta)
            {
                płytyCollection.Add(item);

                //string tmp = null;
                //foreach (var track in item.utwory.lista)
                //    {
                //        tmp += track + ", ";
                //    }
                //płytyCollection.Add(new PłytaDisplay()
                //{
                //    tytuł = item.tytuł,
                //    wykonawca = item.wykonawca[0],
                //    liczbaUtworów = Convert.ToInt32(item.liczbaUtworów),
                //    dataWydania = item.dataWydania.ToShortDateString(),
                //    cena = 5,
                //    gatunek = item.gatunek,
                //    utwory = tmp
                //});
            }
        }
        //private void Dodawanie(object sender, RoutedEventArgs e)
        //{
        //    string login = String.Empty;

        //    try
        //    {
        //        login = WalutaBox.Text.Substring(0, 2) + ImieBox.Text.Substring(0, 2).ToUpper() + NazwiskoBox.Text.Substring(0, 3).ToUpper();
        //    }
        //    catch
        //    {Class1.cs
        //        MessageBox.Show("Za krótkie imię lub nazwisko!", "Błąd!");
        //        return;

        //    }


        //    login = ProcessLogin(login);
        //    if (login == String.Empty) return;

        //    Firma.ListaOsóbList.FirstOrDefault().OsobaList.Add(new Osoba()
        //    {
        //        Imie = ImieBox.Text,
        //        Nazwisko = NazwiskoBox.Text,
        //        Login = login
        //    });
        //    Zatrudnienie zatrudnienie = new Zatrudnienie()
        //    {
        //        IdOsoby = login,
        //        Imie = ImieBox.Text,
        //        Nazwisko = NazwiskoBox.Text
        //    };

        //    zatrudnienie.StanowiskoList = new List<string>();
        //    zatrudnienie.PlacaList = new List<Placa>();
        //    zatrudnienie.EtatList = new List<Etat>();
        //    zatrudnienie.DataZatrudnieniaList = new List<string>();

        //    zatrudnienie.StanowiskoList.Add(StanowiskoBox.Text);
        //    zatrudnienie.PlacaList.Add(new Placa() { Waluta = WalutaBox.Text, XValue = PlacaBox.Text });
        //    zatrudnienie.EtatList.Add(new Etat() { RodzajUmowy = UmowaBox.Text });
        //    zatrudnienie.DataZatrudnieniaList.Add(ZatrudnienieBox.Text);

        //    ZdefiniowanyDzial tmpDzial = (ZdefiniowanyDzial)DzialyBox.SelectedItem;
        //    Firma.DziałList.FirstOrDefault(x => x.IdDzialu == tmpDzial.Id).ZatrudnienieList.Add(zatrudnienie);

        //    if (XmlUtilities.ValidateXmlSchema(Firma))
        //    {
        //        XmlUtilities.SaveData(Firma);
        //        Pracownicy = new ToolsUI.Pracownicy(Firma);
        //        this.PracownicyListBox.DataContext = Pracownicy;
        //        ImieBox.Text = NazwiskoBox.Text = StanowiskoBox.Text = WalutaBox.Text = PlacaBox.Text = UmowaBox.Text = ZatrudnienieBox.Text = String.Empty;
        //    }
        //    else
        //    {
        //        MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
        //        Firma = XmlUtilities.LoadData();
        //    }




        //}

        //private string ProcessLogin(string login)
        //{
        //    if (Firma.ListaOsóbList.FirstOrDefault().OsobaList.Any(element => element.Login == login))
        //    {
        //        try
        //        {
        //            login = ProcessLogin(ChangeLogin(login));
        //        }
        //        catch (Exception)
        //        {
        //            MessageBox.Show("Nie można dodać pracownika.", "Błąd krytyczny");
        //            login = String.Empty;
        //        }
        //    }
        //    return login;
        //}

        //private string ChangeLogin(string login)
        //{
        //    char last = login.Last();
        //    switch (last)
        //    {
        //        case '0':
        //            login = login.Substring(0, 6) + '1';
        //            break;
        //        case '1':
        //            login = login.Substring(0, 6) + '2';
        //            break;
        //        case '2':
        //            login = login.Substring(0, 6) + '3';
        //            break;
        //        case '3':
        //            login = login.Substring(0, 6) + '4';
        //            break;
        //        case '4':
        //            login = login.Substring(0, 6) + '5';
        //            break;
        //        case '5':
        //            login = login.Substring(0, 6) + '6';
        //            break;
        //        case '6':
        //            login = login.Substring(0, 6) + '7';
        //            break;
        //        case '7':
        //            login = login.Substring(0, 6) + '8';
        //            break;
        //        case '8':
        //            login = login.Substring(0, 6) + '9';
        //            break;
        //        case '9':
        //            throw new Exception();
        //        default:
        //            login = login.Substring(0, 6) + '0';
        //            break;
        //    }

        //    return login;
        //}

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            płyta element = (płyta)płytyListView.SelectedItem;
            MessageBoxResult result = MessageBox.Show("Czy na pewno chcesz usunąć płytę " + element.tytuł + " wykonawcy " + element.wykonawca + "?", "Usuwanie", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                //Firma.DziałList.SingleOrDefault(x => x.IdDzialu == element.Dział).ZatrudnienieList.RemoveAll(x => x.IdOsoby == element.IdOsoby);
                //Firma.ListaOsóbList.FirstOrDefault().OsobaList.RemoveAll(x => x.Login == element.IdOsoby);

                płytoteka.zbiór.płyta.Remove(element);

                if (XmlUtilities.ValidateXmlSchema(płytoteka))
                {
                    płytyCollection.Remove((płyta)płytyListView.SelectedItem);
                    XmlUtilities.SaveData(płytoteka);
                }
                else
                {
                    MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
                    płytoteka = XmlUtilities.LoadData();
                }
            }
        }
    }
}
