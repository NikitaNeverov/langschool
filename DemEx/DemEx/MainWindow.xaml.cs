using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;
using System.Data;

namespace DemEx
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ClientClick(object sender, RoutedEventArgs e)
        {
            LanguageSchool db = new LanguageSchool();
            db.Client.Load();
            var lang = from Client in db.Client
                        select new
                        {
                            Client.ID,
                            Client.GenderCode,
                            Client.FirstName,
                            Client.LastName,
                            Client.Patronymic,
                            Client.Birthday,
                            Client.Phone,
                            Client.Email,
                            Client.RegistrationDate
                        };
            ShowClients.ItemsSource = lang.ToList();
            schet.Text = lang.Count().ToString();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            LanguageSchool db = new LanguageSchool();
            var poisk = from client in db.Client
                        where ((client.FirstName.Contains(Textbox1.Text)) || (client.LastName.Contains(Textbox1.Text)) || (client.Patronymic.Contains(Textbox1.Text)
                        || (client.Phone.Contains(Textbox1.Text) || (client.Email.Contains(Textbox1.Text)))))
                        select new
                        {
                            client.ID,
                            client.GenderCode,
                            client.FirstName,
                            client.LastName,
                            client.Patronymic,
                            client.Birthday,
                            client.Phone,
                            client.Email,
                            client.RegistrationDate
                        };
            ShowClients.ItemsSource = poisk.ToList();
            schet.Text = poisk.Count().ToString();
        }

        private void AddClick(object sender, RoutedEventArgs e)
        {
            AddPolz addpolz = new AddPolz();
            addpolz.Show();
            Close();
        }
    }
}
