import React, { useState } from "react";
import MaterialTable from "material-table";
import axios from "axios";

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
  ...restProps
}) {
  const [data, setData] = useState(dataSent);
  const columns = transformHeader(header);
  return (
    <MaterialTable
      title={title}
      data={data}
      columns={columns}
      editable={{
        onRowUpdate: (newData, oldData) => {
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
              }
            );
          }, 600);
        },
      }}
    />
  );
}
