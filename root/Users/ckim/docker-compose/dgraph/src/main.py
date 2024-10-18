# from pydgraph import DgraphClient
import pydgraph

client_stub = pydgraph.DgraphClient("localhost:9080")
client = pydgraph.DgraphClient(client_stub)

print(client)



query = """
{
  queryMovie(filter: {title: {eq: "The Matrix"}}) {
    title
    release_date
  }
}
"""

response = client.txn().query(query, variables={})

print(response.json())
