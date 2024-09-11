from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

# Define the GraphQL query
query = gql('''
{
  fundWithdrawns(first: 5) {
    id
    owner
    amount
    blockNumber
  }
  paymentMades(first: 5) {
    id
    participant
    amount
    blockNumber
  }
}
''')

# Define the URL of your subgraph
url = 'https://api.studio.thegraph.com/query/87752/nsmqfundraiser/version/latest'

# Create a transport layer for the HTTP connection
transport = RequestsHTTPTransport(
    url=url,
    use_json=True,
)

# Create a GraphQL client using the transport layer
client = Client(transport=transport, fetch_schema_from_transport=True)

# Function to fetch data from the subgraph
def fetch_subgraph_data():
    try:
        response = client.execute(query)
        print(response)
    except Exception as e:
        print(f"Error: {e}")

# Call the function to execute the query and print the response
fetch_subgraph_data()
