import { FC, useState } from "react";
import { useTranslation } from "react-i18next";
import { useInfiniteQuery } from "@tanstack/react-query";
import { useRecoilState, useRecoilValue } from "recoil";
import { locationState } from "@/state/location";
import { roleState } from "@/state/role";
import { tokenState } from "@/state/token";
import { GameInstanceSearchParams } from "@/types/GameInstance";
import { User } from "@/types/User";
import { UserApi } from "@/api/UserApi";
import { Map, LocationButton, LocationMarker } from "@/components/Map";
import LoadingMap from "@/components/Map/LoadingMap";
import UserMarker from "@/components/Map/UserMarker";
import { useToast } from "@/components/ui/use-toast";

const DEFAULT_SEARCH_PARAMS: GameInstanceSearchParams = {
  searchName: "",
};

const USERS_PAGE_SIZE = 10;

const Dashboard: FC = () => {
  const [location, setLocation] = useRecoilState(locationState);
  const [searchParams] = useState<GameInstanceSearchParams>(DEFAULT_SEARCH_PARAMS);
  const [,setUserParam] = useState<User | null>(null);
  const [hoveredUserUUID] = useState("");
  const [latitude, longitude] = location as number[];
  const { toast } = useToast();
  const {
    t,
  } = useTranslation();

  const token = useRecoilValue(tokenState);
  const role = useRecoilValue(roleState);

  const {
    data: users,
    isLoading: isUsersLoading,
    fetchNextPage: usersFetchNextPage,
    isFetchingNextPage: isFetchingUsersNextPage,
  } = useInfiniteQuery({
    queryKey: ["user-pins", { ...searchParams, token, role }],
    queryFn: ({ pageParam = 0 }) =>
      UserApi.search(latitude, longitude, pageParam as number, USERS_PAGE_SIZE, searchParams),
    getNextPageParam: (_, pages) => {
      const newPageParam = pages.length;
      return newPageParam < pages[0].paginationInfo.totalPages ? newPageParam : undefined;
    },
    onSuccess: data => {
      if (data.pages[0].paginationInfo.totalPages > data.pages.length) {
        usersFetchNextPage();
      }
    },
    onError: () => {
      toast({
        title: t("errorFetchingUsersOnMap"),
        description: t("tryRefreshing"),
        variant: "destructive",
      });
    },
  });

  return (
    <div className="flex h-full w-full flex-col gap-6 lg:flex-row">
      <div className="flex-grow overflow-hidden rounded-lg bg-section">
        <Map autolocate location={location} setLocation={setLocation}>
          {isUsersLoading || isFetchingUsersNextPage ? <LoadingMap /> : <></>}
          <LocationButton />
          <LocationMarker disabled />
          <>
            {users &&
              users?.pages
                .flatMap(page => page.results)
                .map(user => (
                  <UserMarker
                    user={user}
                    key={user.uuid}
                    onClick={setUserParam}
                    active={user.uuid === hoveredUserUUID}
                  />
                ))}
          </>
        </Map>
      </div>
      <div className="flex h-1/2 flex-col gap-4 rounded-lg bg-section p-4 lg:h-full lg:w-[700px]">
      </div>
    </div>
  );
};

export default Dashboard;
