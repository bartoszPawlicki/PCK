using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
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

            Edit.IsEnabled = false;
            Save.IsEnabled = false;
            Cancel.IsEnabled = false;
            EditSave.IsEnabled = false;

            SetEnabledBoxes(false);

            płytoteka = new płytoteka();

            XmlUtilities = new XmlUtilities("Dokumenty//plytoteka.xml", new string[3] { "Dokumenty//HeaderNamespace.xsd", "Dokumenty//NumericalTypesNamespace.xsd", "Dokumenty//OurNamespace.xsd" });

            OpenApplication();

            płytyListView.ItemsSource = płytyCollection;
            walutaComboBox.ItemsSource = Enum.GetValues(typeof(cenaWaluta));
            comboBox.ItemsSource = Enum.GetValues(typeof(gatunek));
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
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            płyta element = (płyta)płytyListView.SelectedItem;
            MessageBoxResult result = MessageBox.Show("Czy na pewno chcesz usunąć płytę " + element.tytuł + " wykonawcy " + element.wykonawca[0] + "?", "Usuwanie", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
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
            SetEnabledBoxes(false);
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            Save.IsEnabled = true;
            Cancel.IsEnabled = true;
            Add.IsEnabled = false;
            Delete.IsEnabled = false;
            Edit.IsEnabled = false;
            EditSave.IsEnabled = false;

            Save.Visibility = Visibility.Visible;
            EditSave.Visibility = Visibility.Hidden;

            tytułBox.Text = "";
            wykonawcaBox.Text = "";
            cenaBox.Text = "";
            listaUtworówBox.Text = "";
            datePicker.Text = "";
            comboBox.Text = "";
            liczbaUtworówBox.Text = "";
            walutaComboBox.Text = null;

            SetEnabledBoxes(true);
        }

        private void płytyListView_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            Edit.IsEnabled = true;
            Delete.IsEnabled = true;

            płyta element = (płyta)płytyListView.SelectedItem;
            tytułBox.Text = element.tytuł;
            wykonawcaBox.Text = element.wykonawca[0];
            cenaBox.Text = element.cenaProperty;
            listaUtworówBox.Text = element.utworyProperty;
            datePicker.Text = element.dataWydaniaProperty;
            comboBox.Text = element.gatunek.ToString();
            liczbaUtworówBox.Text = element.liczbaUtworów.ToString();
            walutaComboBox.Text = element.cena.waluta.ToString();
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            if (płytyListView.SelectedItem != null)
            {
                płyta element = (płyta)płytyListView.SelectedItem;

                tytułBox.Text = element.tytuł;
                wykonawcaBox.Text = element.wykonawca[0];
                cenaBox.Text = element.cenaProperty;
                listaUtworówBox.Text = element.utworyProperty;
                datePicker.Text = element.dataWydaniaProperty;
                comboBox.Text = element.gatunek.ToString();
                liczbaUtworówBox.Text = element.liczbaUtworów.ToString();
                walutaComboBox.Text = element.cena.waluta.ToString();

                Save.Visibility = Visibility.Hidden;
                EditSave.Visibility = Visibility.Visible;

                Save.IsEnabled = false;
                Cancel.IsEnabled = true;
                Add.IsEnabled = false;
                Delete.IsEnabled = false;
                Edit.IsEnabled = false;
                EditSave.IsEnabled = true;

                SetEnabledBoxes(true);
            }
        }

        private void SetEnabledBoxes(bool bul)
        {
            tytułBox.IsEnabled = bul;
            wykonawcaBox.IsEnabled = bul;
            cenaBox.IsEnabled = bul;
            listaUtworówBox.IsEnabled = bul;
            datePicker.IsEnabled = bul;
            comboBox.IsEnabled = bul;
            liczbaUtworówBox.IsEnabled = bul;
            walutaComboBox.IsEnabled = bul;
        }
        private void EditSave_Click(object sender, RoutedEventArgs e)
        {
            płyta nowa = (płyta)płytyListView.SelectedItem;

            nowa.tytuł = tytułBox.Text;
            nowa.wykonawca[0] = wykonawcaBox.Text;
            nowa.cena.Value = float.Parse(cenaBox.Text);
            cenaWaluta waluta;
            Enum.TryParse<cenaWaluta>(walutaComboBox.SelectedValue.ToString(), out waluta);
            nowa.cena.waluta = waluta;
            nowa.utworyProperty = listaUtworówBox.Text;
            nowa.liczbaUtworów = decimal.Parse(liczbaUtworówBox.Text);
            gatunek status;
            Enum.TryParse<gatunek>(comboBox.SelectedValue.ToString(), out status);
            nowa.gatunek = status;
            nowa.dataWydania = datePicker.SelectedDate.Value;

            if (XmlUtilities.ValidateXmlSchema(płytoteka))
            {
                XmlUtilities.SaveData(płytoteka);
                LoadPłytyFromXML();
                this.płytyListView.ItemsSource = płytyCollection;
                tytułBox.Text = "";
                wykonawcaBox.Text = "";
                cenaBox.Text = "";
                listaUtworówBox.Text = "";
                datePicker.Text = "";
                comboBox.Text = "inny";
                liczbaUtworówBox.Text = "";
            }
            else
            {
                MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
                płytoteka = XmlUtilities.LoadData();
            }

            Save.IsEnabled = false;
            Cancel.IsEnabled = false;
            Add.IsEnabled = true;
            Delete.IsEnabled = false;
            Edit.IsEnabled = false;
            EditSave.IsEnabled = false;

            SetEnabledBoxes(false);
        }
        private void Save_Click(object sender, RoutedEventArgs e)
        {
            płyta nowa = new płyta();
            nowa.wykonawca = new string[2];
            nowa.cena = new cena();
            nowa.utwory = new płytaUtwory();
            nowa.utwory.lista = new utwór[int.Parse(liczbaUtworówBox.Text)];
            for (int h = 0; h < int.Parse(liczbaUtworówBox.Text); h++)
            {
                nowa.utwory.lista[h] = new utwór();
            }

            nowa.tytuł = tytułBox.Text;
            nowa.wykonawca[0] = wykonawcaBox.Text;
            nowa.cena.Value = float.Parse(cenaBox.Text);
            cenaWaluta waluta;
            Enum.TryParse<cenaWaluta>(walutaComboBox.SelectedValue.ToString(), out waluta);
            nowa.cena.waluta = waluta;
            nowa.utworyProperty = listaUtworówBox.Text;
            nowa.liczbaUtworów = decimal.Parse(liczbaUtworówBox.Text);
            gatunek status;
            Enum.TryParse<gatunek>(comboBox.SelectedValue.ToString(), out status);
            nowa.gatunek = status;
            nowa.dataWydania = datePicker.SelectedDate.Value;

            płytoteka.zbiór.płyta.Add(nowa);

            if (XmlUtilities.ValidateXmlSchema(płytoteka))
            {
                XmlUtilities.SaveData(płytoteka);
                LoadPłytyFromXML();
                this.płytyListView.ItemsSource = płytyCollection;
                tytułBox.Text = "";
                wykonawcaBox.Text = "";
                cenaBox.Text = "";
                listaUtworówBox.Text = "";
                datePicker.Text = "";
                comboBox.Text = "inny";
                liczbaUtworówBox.Text = "";

                Save.IsEnabled = false;
                Cancel.IsEnabled = false;
                Add.IsEnabled = true;
                Delete.IsEnabled = false;
                Edit.IsEnabled = false;
                EditSave.IsEnabled = false;

                SetEnabledBoxes(false);
            }
            else
            {
                MessageBox.Show("Edycja danych niezgodna z XML Schema!", "Błąd!");
                płytoteka = XmlUtilities.LoadData();
            }

        }
        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Save.IsEnabled = false;
            Cancel.IsEnabled = false;
            Add.IsEnabled = true;
            Delete.IsEnabled = true;
            Edit.IsEnabled = true;
            EditSave.IsEnabled = false;

            tytułBox.Text = "";
            wykonawcaBox.Text = "";
            cenaBox.Text = "";
            listaUtworówBox.Text = "";
            datePicker.Text = "";
            comboBox.Text = "inny";
            liczbaUtworówBox.Text = "";

            SetEnabledBoxes(false);
        }
    }
}
