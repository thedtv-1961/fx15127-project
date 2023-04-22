import React from 'react';
import PropTypes from 'prop-types';

Paginate.propTypes = {
  currentPage: PropTypes.number.isRequired
}

export default function Paginate(props) {
  return (
    <nav>
      <ul className="pagination pagination-sm justify-content-center">
        <li className="page-item">
          <a className="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">«</span>
          </a>
        </li>
        <li className="page-item"><a className="page-link" href="#">1</a></li>
        <li className="page-item active"><a className="page-link" href="#">2</a></li>
        <li className="page-item"><a className="page-link" href="#">3</a></li>
        <li className="page-item">
          <a className="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">»</span>
          </a>
        </li>
      </ul>
    </nav>
  );
}
