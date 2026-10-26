declare module '@apiverve/sanctionscreening' {
  export interface sanctionscreeningOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface sanctionscreeningResponse {
    status: string;
    error: string | null;
    data: SanctionsScreeningData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface SanctionsScreeningData {
      query:        null | string;
      matched:      boolean | null;
      matchCount:   number | null;
      verdict:      null | string;
      topScore:     number | null;
      results:      Result[];
      matchedLists: (null | string)[];
      list:         List;
      lists:        List[];
  }
  
  interface List {
      source:      null | string;
      authority:   null | string;
      publishDate: null | string;
      recordCount: number | null;
      lastUpdated: Date | null;
      code?:       null | string;
  }
  
  interface Result {
      uid:           number | null;
      name:          null | string;
      type:          null | string;
      score:         number | null;
      confidence:    null | string;
      matchedOn:     null | string;
      matchedVia:    null | string;
      isWeakAlias:   boolean | null;
      programs:      (null | string)[];
      title:         null;
      aka:           Aka[];
      dateOfBirth:   any[];
      placeOfBirth:  any[];
      nationalities: any[];
      citizenships:  any[];
      addresses:     Address[];
      ids:           any[];
      remarks:       null;
      source:        null | string;
      sourceID:      null | string;
      listedOn:      null;
  }
  
  interface Address {
      address1:    null | string;
      city:        null | string;
      postalCode?: null | string;
      country:     null | string;
  }
  
  interface Aka {
      name:     null | string;
      type:     null | string;
      strength: null | string;
  }

  export default class sanctionscreeningWrapper {
    constructor(options: sanctionscreeningOptions);

    execute(callback: (error: any, data: sanctionscreeningResponse | null) => void): Promise<sanctionscreeningResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: sanctionscreeningResponse | null) => void): Promise<sanctionscreeningResponse>;
    execute(query?: Record<string, any>): Promise<sanctionscreeningResponse>;
  }
}
