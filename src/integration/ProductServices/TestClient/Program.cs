using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestClient.ProductServices;

namespace TestClient
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Reading input...");
            InventoryUpdate inventoryUpdate = new InventoryUpdate
            {
                ProductName = args[0],
                SerialNumber = args[1],
                Location = args[2],
                UpdateDate = DateTime.ParseExact(args[3], "MM-dd-yyyy", CultureInfo.InvariantCulture),
                QuantityChange = args[4]
            };

            Console.WriteLine("Calling service...");
            using (ProcessInventoryUpdateClient client = new ProcessInventoryUpdateClient())
            {
                client.SubmitData(inventoryUpdate);
            }

            Console.WriteLine("Done!");
        }
    }
}
