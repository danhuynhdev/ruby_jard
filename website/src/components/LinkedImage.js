import React from 'react';
import useBaseUrl from '@docusaurus/useBaseUrl';

export const LinkedImage = ({link, alt}) => (
  <>
    <a target="_blank" href={useBaseUrl(link)} style={{display: 'block'}}>
      <div style={{lineHeight: 0, display: 'inline-block'}}>
        <img alt={alt} src={useBaseUrl(link)} style={{borderRadius: '7px'}}/>
        <div className="alert alert--secondary" style={{padding: '1.5rem'}}>{alt}. Click to enlarge.</div>
      </div>
    </a>
    <br/>
  </>
);
