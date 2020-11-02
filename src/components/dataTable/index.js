import React, { useState } from "react";
import MaterialTable from "material-table";
import axios from "axios";

// Transforms a header which contains an array of strings to an object for material-table
// Ex: "population" => {title: "Population", field: "population"}
const transformHeader = (header) => {
  let transformedHeader = [];
  header.forEach((element) => {
    transformedHeader.push({ title: element.toUpperCase(), field: element });
  });
  return transformedHeader;
};

// Data is the dataset used, header is an array of strings
export default function DataTable({
  children,
  title,
  dataSent,
  header,
  apiUrl,
  databaseChanged,
  ...restProps
}) {
  // Using hooks to manage state of table changes in the front-end.
  const [data, setData] = useState(dataSent);
  const columns = transformHeader(header);
  return (
    <MaterialTable
      title={title}
      data={data}
      columns={columns}
      options={{
        headerStyle: {
          padding: "1rem 1.5rem",
        },
        rowStyle: {
          textAlign: "center",
          padding: "1rem",
        },
        actionsCellStyle: {
          padding: "1rem",
        },
        searchFieldStyle: {
          padding: "0.5rem",
        },
      }}
      editable={{
        onRowUpdate: (newData, oldData) => {
          // Based on material-table documentation for updating row dynamically.
          return new Promise((resolve) => {
            setTimeout(() => {
              resolve();
            });
            axios({ method: "POST", url: apiUrl, data: newData }).then(
              (result) => {
                const dataUpdate = [...data];
                const index = oldData.tableData.id;
                dataUpdate[index] = newData;
                setData([...dataUpdate]);
                databaseChanged();
              }
            );
          }, 600);
        },
      }}
    />
  );
}
