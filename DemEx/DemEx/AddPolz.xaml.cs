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
using System.Windows.Shapes;

namespace DemEx
{
    /// <summary>
    /// Логика взаимодействия для AddPolz.xaml
    /// </summary>
    public partial class AddPolz : Window
    {
        public AddPolz()
        {
            InitializeComponent();
        }

        private void AddClick(object sender, RoutedEventArgs e)
        {
            if (Imya.Text == "" || Family.Text == "" ||
                otchestvo.Text == "" || email.Text == "" ||
                phone.Text == "" || pol.Text == "" || rozdenie.Text == "" || reg.Text == "")
            {
                MessageBox.Show("Обязательно заполните каждое поле!");
            } //Проверка на заполнение полей
            else
            {
                LanguageSchool bd = new LanguageSchool();

                var adduser = bd.Client
               .Where(n => n.FirstName == Imya.Text)
               .FirstOrDefault();

                if ((adduser == null) && Imya.Text != "" || Family.Text != "" ||
                otchestvo.Text != "" || email.Text != "" ||
                phone.Text != "" || pol.Text != "" || rozdenie.Text != "" || reg.Text != "")
                {
                    string Name = Imya.Text;
                    string Familiya = Family.Text;
                    string Otch = otchestvo.Text;
                    string Email = email.Text;
                    string Phone = phone.Text;
                    string Pol = pol.Text;
                    DateTime Rozdenie = Convert.ToDateTime(rozdenie.Text);
                    DateTime Registration = Convert.ToDateTime(reg.Text);

                    adduser = new Client();

                    adduser.FirstName = Name;
                    adduser.LastName = Familiya;
                    adduser.Patronymic = Otch;
                    adduser.Email = Email;
                    adduser.Phone = Phone;
                    adduser.GenderCode = Pol;
                    adduser.Birthday = Rozdenie;
                    adduser.RegistrationDate = Registration;


                    bd.Client.Add(adduser);
                    bd.SaveChanges();
                    MessageBox.Show("Данные успешно добавлены!");
                }
            }
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            Close();
        }
    }
}
